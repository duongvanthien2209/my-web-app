import { renderHook } from '@testing-library/react'
import {useCustomHook} from "@/hooks/useCustomHook";

test('useCustomHook returns the correct initial value', () => {
    const { result } = renderHook(() => useCustomHook());
    expect(result.current).toBe(1);
});